import React, { useEffect, useState } from "react";
import axios from "axios";

interface Player {
    id: number;
    name: string;
}

const PlayerList: React.FC = () => {
    const [players, setPlayers] = useState<Player[]>([]);

    useEffect(() => {
        axios.get("/api/players")
            .then(response => setPlayers(response.data))
            .catch(error => console.error("Error fetching players:", error));
    }, []);

    return (
        <div>
            <h2>Player List</h2>
            <ul>
                {players.map(p => (
                    <li key={p.id}>{p.name}</li>
                ))}
            </ul>
        </div>
    );
};

export default PlayerList;
